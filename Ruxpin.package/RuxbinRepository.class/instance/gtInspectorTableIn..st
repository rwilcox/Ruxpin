as yet unclassified
gtInspectorTableIn: composite
	<gtInspectorPresentationOrder: -15>
	composite table
		title: 'Table';
		"display: [ self  ];"
		column: 'Book' evaluated: [ :each | each title  ];
		column: 'Kind' evaluated: [ :each | each kind ].